# Use official Nginx image
FROM nginx:alpine

# Remove the default Nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy your site files into the container
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80
