#add pods to 3
kubectl scale --replicas=3 deployment nginx-hello

#check status
kubectl get deployments
kubectl get pods

#replacing new image using rolling update
kubectl set image deployment nginx-hello nginx-hello=alchemistbear/nginx-hello1.0

#rollstatus
kubectl rollout status deployment nginx-hello

#rollback if needed
#kubectl rollout undo deployment udacitypod
