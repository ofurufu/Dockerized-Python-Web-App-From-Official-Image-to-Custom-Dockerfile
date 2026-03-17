# Intentionally used a small official Python image instead of a large general-purpose one
# As Docker recommends choosing the right base image and keeping images lean.
FROM python:3.12-slim

# I set the working directory inside the image
# Know that after this, COPY/RUN/CMD are relative to /app unless changed.
WORKDIR /app

# Coped dependency file first
# This supports better layer caching because requirements change less often than app code.
COPY requirements.txt .

# This Installs dependencies during build time
# RUN happens while the image is being built, not when the container starts.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application into the image
# This happens after dependencies for better cache reuse.
COPY . .

# Explicitly document the port the app listens on inside the container
# EXPOSE does not publish the port to your laptop by itself.
EXPOSE 5000

# Default command to start the app when the container runs
# CMD is runtime behavior, unlike RUN which is build-time behavior.
CMD ["python", "app.py"]