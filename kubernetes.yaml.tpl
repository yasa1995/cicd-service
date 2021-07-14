apiVersion: apps/v1
kind: Deployment
metadata:
  name: pulsebackrepo
  namespace: default
spec:
  progressDeadlineSeconds: 600
  replicas: 3
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: pulsebackrepo
  template:
    metadata:
      labels:
        app: pulsebackrepo
    spec:
      containers:
      - image: VAR_IMAGE
        imagePullPolicy: IfNotPresent
        name: pulsebackrepo
---
apiVersion: v1
kind: Service
metadata:
  labels:
    app: pulsebackrepo
spec:
  ports:
  - nodePort: 30160
    port: 80
    protocol: TCP
    targetPort: 8080
  selector:
    app: pulsebackrepo
  type: LoadBalancer

