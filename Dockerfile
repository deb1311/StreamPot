# Base Node image
FROM node:20

# Set working directory
WORKDIR /app

# Copy everything and install pnpm
COPY . .

RUN corepack enable && corepack prepare pnpm@latest --activate

# Move to core package and install dependencies
WORKDIR /app/packages/core
RUN pnpm install --frozen-lockfile

# Expose port (Cloud Run default)
ENV PORT=8080
EXPOSE 8080

# Start the Streampot service
CMD ["pnpm", "start"]
