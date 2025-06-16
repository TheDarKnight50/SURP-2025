FROM nvidia/cuda:12.9.0-cudnn-devel-ubuntu22.04

# Set environment variable for clean Python output
ENV PYTHONUNBUFFERED=1

# Set working directory inside container
WORKDIR /app

# Install system packages
RUN apt-get update && apt-get install -y \
    python3 python3-pip git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Default command
CMD ["bash"]
