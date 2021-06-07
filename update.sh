#!/bin/bash

helm lint helm-chart-sources/*
helm package helm-chart-sources/*
helm repo index --url https://fstop-andy-lee.github.io/helm-chart/ --merge index.yaml .

git add . && git commit -m "update" && git push origin master
