# Base Image
FROM  python:3.9-slim

# Work Dir
WORKDIR /app

# Copy all the app content
COPY app/ /app

# Install the dependencies
RUN pip install -r requirements.txt

# Expose the port
EXPOSE 5000

# Start the application
CMD ["python", "app.py"]
