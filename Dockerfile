# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the packaged JAR file into the container at the working directory
COPY school-0.0.1-SNAPSHOT.jar /app/school-0.0.1-SNAPSHOT.jar

# Expose port 8080 from the container to the host
EXPOSE 8080

# Specify the command to run on container start
CMD ["java", "-jar", "school-0.0.1-SNAPSHOT.jar"]
