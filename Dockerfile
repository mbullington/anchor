FROM denoland/deno:1.46.2

# The port that your application listens to.
EXPOSE 43385

WORKDIR /app

# Copy mod.ts from the current directory to /app in the container
COPY mod.ts .

# Prefer not to run as root.
USER deno

# Compile the app to check for errors and cache dependencies
RUN deno cache mod.ts

CMD ["run", "--allow-all", "./mod.ts"]
