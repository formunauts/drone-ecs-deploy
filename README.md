# ECS deploy plugin for drone.io

[https://hub.docker.com/r/formunauts/drone-ecs-deploy/](https://hub.docker.com/r/formunauts/drone-ecs-deploy/)

This plugin allows updating an ECS service.

## Usage

This pipeline will update the `my-cluster` cluster and `my-service` service with the image tagged `my-image:latest`

```yaml
steps:
  - name: deploy
    image: formunauts/drone-ecs-deploy
    settings:
      cluster: my-cluster
      service: my-service
      image_name: my-image:latest
      aws_region: us-east-1
```

## Optional secrets

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY

If no AWS_ACCESS_KEY_ID && AWS_SECRET_ACCESS_KEY the plugin will use the instance IAM role.
