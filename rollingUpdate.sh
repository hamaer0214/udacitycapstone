#增加pod数量
kubectl scale --replicas=3 deployment nginx-hello

#验证
kubectl get deployments
kubectl get pods

#update
kubectl set image deployment nginx-hello nginx-hello=alchemistbear/nginx-hello1.0

#rollstatus
kubectl rollout status deployment nginx-hello

#rollback
#kubectl rollout undo deployment udacitypod
