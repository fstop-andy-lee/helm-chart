
## create git repo

1. git config user.email "andy_lee@fstop.com.tw"

2. git config user.name "Andy Lee"

## create helm chart repo

1. Create robots.txt 
   echo -e “User-Agent: *\nDisallow: /” > robots.txt

2. Create source folder and helm charts
   mkdir ./helm-chart-sources
   helm create helm-chart-sources/helm-chart-test
   
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
   
   