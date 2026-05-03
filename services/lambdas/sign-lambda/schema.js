import { z } from "zod";

const allowedContentTypes = [
  "image/jpeg",
  "image/png",
  "image/gif",
  "image/webp",
];
const safeFileNamePattern = /^[a-zA-Z0-9._-]+$/;

export const signLambdaRequestSchema = z.object({
  fileName: z
    .string()
    .trim()
    .min(1, "fileName is required")
    .max(255, "fileName is too long")
    .regex(
      safeFileNamePattern,
      "fileName can only contain letters, numbers, dots, underscores, and hyphens",
    ),
  contentType: z.enum(allowedContentTypes),
});
