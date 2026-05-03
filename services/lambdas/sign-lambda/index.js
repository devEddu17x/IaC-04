import { S3Client } from "@aws-sdk/client-s3";
import { createPresignedPost } from "@aws-sdk/s3-presigned-post";
import { signLambdaRequestSchema } from "./schema.js";

const region = process.env.AWS_REGION;
const bucketName = process.env.S3_BUCKET;
const prefix = process.env.UPLOADS_PREFIX || "uploads";

export const handler = async (event) => {
  try {
    const s3Client = new S3Client({ region });
    const rawBody = event.body ? JSON.parse(event.body) : event;
    const validationResult = signLambdaRequestSchema.safeParse(rawBody);

    if (!validationResult.success) {
      return {
        statusCode: 400,
        body: JSON.stringify({
          error: "Invalid request body.",
          details: validationResult.error.flatten(),
        }),
      };
    }

    const { fileName, contentType } = validationResult.data;

    const key = `${prefix}/${Date.now()}-${fileName}`;

    const { url, fields } = await createPresignedPost(s3Client, {
      Bucket: bucketName,
      Key: key,
      Conditions: [
        ["content-length-range", 0, 10485760],
        ["eq", "$Content-Type", contentType],
      ],
      Fields: {
        "Content-Type": contentType,
      },
      Expires: 300,
    });

    return {
      statusCode: 200,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ url, fields }),
    };
  } catch (error) {
    console.error("Error generando firma:", error);
    return {
      statusCode: 500,
      body: JSON.stringify({
        error: "Internal server error.",
      }),
    };
  }
};
