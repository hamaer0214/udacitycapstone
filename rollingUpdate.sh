#增加pod数量
kubectl scale --replicas=2 deployment nginx-hello

#验证
kubectl get deployments
kubectl get pods

#update
kubectl set image deployment udacitypod udacitypod=alchemistbear/nginx-hello1.0

#rollstatus
#kubectl rollout status deployment udacitypod

#rollback
#kubectl rollout undo deployment udacitypod