# CodeDeployによるデプロイ

## 前提
- githubにリポジトリがあります
- AWS CodePipelineおよびCodeDeployによりデプロイします

## 方針
- リポジトリにmaster, develop, その他更新時にAWS環境でなにかしたい処理に応じたブランチを作ります
  - ベースイメージを更新するcontainer-imageとかDB更新を反映するmigrate-developとか
- CodeDeployで各パイプラインに対応したデプロイメントグループを作ります
- CodePipelineで各ブランチに対応したパイプラインを作ります


## 設定手順
- CodeDeploy