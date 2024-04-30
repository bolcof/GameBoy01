#include <ESP8266WiFi.h>

String ssid;
String password;

void setup() {
  Serial.begin(74880);
  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  delay(100);

  // Wi-Fiネットワークのスキャンを開始
  Serial.println("Wi-Fiネットワークのスキャンを開始します...");
  int networkCount = WiFi.scanNetworks();
  if (networkCount == 0) {
    Serial.println("利用可能なネットワークが見つかりませんでした。");
  } else {
    Serial.print(networkCount);
    Serial.println(" 個のネットワークを検出しました。");
    for (int i = 0; i < networkCount; ++i) {
      Serial.print("ネットワーク ");
      Serial.print(i + 1);
      Serial.print(": ");
      Serial.println(WiFi.SSID(i));
    }
  }

  // ユーザーにSSIDとパスワードの入力を促す
  Serial.println("接続したいSSIDを入力してください:");
  while (Serial.available() == 0) {} // ユーザーの入力を待つ
  ssid = Serial.readStringUntil('\n'); // 改行まで読み込む
  ssid.trim(); // 改行文字を削除

  Serial.println("パスワードを入力してください:");
  while (Serial.available() == 0) {} // ユーザーの入力を待つ
  password = Serial.readStringUntil('\n'); // 改行まで読み込む
  password.trim(); // 改行文字を削除

  // Wi-Fiに接続
  Serial.println("指定されたネットワークに接続を試みます...");
  WiFi.begin(ssid.c_str(), password.c_str());
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("接続されました!");
  Serial.print("IPアドレス: ");
  Serial.println(WiFi.localIP());
}

void loop() {
  // このコードではループ内での処理はありません
}
