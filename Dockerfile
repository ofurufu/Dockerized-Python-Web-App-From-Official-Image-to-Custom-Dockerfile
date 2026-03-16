# Use a small official Python image instead of a large general-purpose one
# Docker recommends choosing the right base image and keeping images lean.
FROM python:3.12-slim

# Set the working directory inside the image
# After this, COPY/RUN/CMD are relative to /app unless changed.
WORKDIR /app

# Copy dependency file first
# This supports better layer caching because requirements change less often than app code.
COPY requirements.txt .

# Install dependencies during build time
# RUN happens while the image is being built, not when the container starts.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application into the image
# This happens after dependencies for better cache reuse.
COPY . .

# Document the port the app listens on inside the container
# EXPOSE does not publish the port to your laptop by itself.
EXPOSE 5000

# Default command to start the app when the container runs
# CMD is runtime behavior, unlike RUN which is build-time behavior.
CMD ["python", "app.py"]