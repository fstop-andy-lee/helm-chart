
## create git repo

1. git config user.email "andy_lee@fstop.com.tw"

2. git config user.name "Andy Lee"

## create helm chart repo

1. Create robots.txt 

   echo -e “User-Agent: *\nDisallow: /” > robots.txt

2. Create source folder and helm charts

   mkdir ./helm-chart-sources
   
   helm create helm-chart-sources/helm-chart-test
   
   helm create helm-chart-sources/swift-messaging
   
3. Lint the chart

   helm lint helm-chart-sources/*

4. Create the Helm chart package

   helm package helm-chart-sources/*

5. Create the Helm chart repository index

   helm repo index --url https://fstop-andy-lee.github.io/helm-chart/ .   

6. Push the git repository on Git repo

   git add . && git commit -m "commit" && git push origin master
   
7. Configure the “helm-chart” repository as a web pages site

8. Configure helm client

   helm repo add testrepo https://fstop-andy-lee.github.io/helm-chart/

9. Test the Helm chart repository

   helm search repo

10. Add new charts to an existing repository

   helm repo index --url https://fstop-andy-lee.github.io/helm-chart/ --merge index.yaml .
   
## helm chart 結構

    mychart
    ├── Chart.yaml
    ├── charts # 存放其他相依的 chart 
    ├── templates # chart 模板
    │   ├── NOTES.txt # helm install 時候的提示訊息
    │   ├── _helpers.tpl # 建立模板的輔助
    │   ├── deployment.yaml # Kubernetes deployment 配置檔
    │   ├── ingress.yaml # Kubernetes ingress 配置檔
    │   ├── service.yaml # Kubernetes service 配置檔
    │   ├── serviceaccount.yaml # Kubernetes serviceaccount 配置檔
    │   └── tests
    │       └── test-connection.yaml
    └── values.yaml # 定義 chart 模板中的自定義設定值，可以在 helm install 或 helm update 覆寫

	