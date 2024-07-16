FROM wordpress:php7.4

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    rsync \
    && rm -rf /var/lib/apt/lists/*

# WordPressのバージョンを指定してダウンロード
RUN curl -o /usr/src/wordpress.tar.gz https://wordpress.org/wordpress-6.5.tar.gz && \
    tar -xzf /usr/src/wordpress.tar.gz -C /usr/src/ && \
    rm /usr/src/wordpress.tar.gz && \
    rsync -av --ignore-existing /usr/src/wordpress/ /var/www/html/

# カスタム php.ini を適用
COPY php.ini /usr/local/etc/php/
