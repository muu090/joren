# ベースにするイメージ
FROM ruby:2.6.3

# 必要なパッケージのアップデート及びインストール
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client

# コンテナ内にappディレクトリを作成
RUN mkdir /app

# 作成したappディレクトリに移動
RUN cd /app

# appディレクトリでbundlerをインストール
RUN gem install bundler

# ローカルの全てのディレクトリをコンテナ内のappディレクトリにコピー
COPY . /app

# 作業ディレクトリをappディレクトリに指定
WORKDIR /app

# コンテナがリッスンするport番号を3000に設定（http://localhost:3000/ でアクセス可能にする）
EXPOSE 3000

# 実行したいコマンド
CMD ["/bin/bash"]