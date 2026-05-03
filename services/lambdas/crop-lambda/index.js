import {
  S3Client,
  GetObjectCommand,
  PutObjectCommand,
} from "@aws-sdk/client-s3";
import sharp from "sharp";

const s3Client = new S3Client({ region: process.env.AWS_REGION });
const bucketName = process.env.S3_BUCKET;
const processedPrefix = process.env.PROCESSED_PREFIX || "processed";

const circleMask = Buffer.from(`
  <svg width="40" height="40" viewBox="0 0 40 40">
    <circle cx="20" cy="20" r="20" fill="white" />
  </svg>
`);

export const handler = async (event) => {
  console.log("Starting process for: \n", JSON.stringify(event));

  for (const record of event.Records) {
    try {
      const s3Event = JSON.parse(record.body);

      if (s3Event.Event === "s3:TestEvent") continue;

      const s3Record = s3Event.Records[0];
      const originalKey = decodeURIComponent(
        s3Record.s3.object.key.replace(/\+/g, " "),
      );

      console.log(`Processing image: s3://${bucketName}/${originalKey}`);

      const { Body } = await s3Client.send(
        new GetObjectCommand({ Bucket: bucketName, Key: originalKey }),
      );

      const imageBuffer = Buffer.from(await Body.transformToByteArray());

      console.log(
        `Image downloaded successfully: s3://${bucketName}/${originalKey}`,
      );
      const processedBuffer = await sharp(imageBuffer)
        .resize(40, 40, { fit: "cover", position: "centre" })
        .png()
        .composite([{ input: circleMask, blend: "dest-in" }])
        .toBuffer();
      console.log(
        `Image processed successfully: s3://${bucketName}/${originalKey}`,
      );
      const newKey = originalKey
        .replace("uploads/", `${processedPrefix}/`)
        .replace(/\.[^.]+$/, ".png");

      await s3Client.send(
        new PutObjectCommand({
          Bucket: bucketName,
          Key: newKey,
          Body: processedBuffer,
          ContentType: "image/png",
        }),
      );

      console.log(`Image saved successfully: s3://${bucketName}/${newKey}`);
    } catch (error) {
      console.error(`Error processing SQS record:`, error);
      return {
        statusCode: 500,
        body: JSON.stringify({ error: "Error processing image." }),
      };
    }
  }

  return { statusCode: 200, body: "Success" };
};
