https://medium.com/hashmapinc/a-quick-start-guide-to-using-the-snowflake-connector-for-kafka-a1cc2d43f521
openssl genrsa 2048 | openssl pkcs8 -topk8 -inform PEM -out rsa_key.p8
password Govinda
openssl rsa -in rsa_key.p8 -pubout -out rsa_key.pub
SNOWSQL configuration
cd ~/.snowsql
/home/ec2-user/.snowsql
private-key-file=/home/ec2-user/sql/kafka/rsa_key.p8
export SNOWSQL_PRIVATE_KEY_PASSPHRASE='Govinda'

snowsql -a yd55881.east-us-2.azure -u kafka_snowflake_connector --private-key-path  /home/ec2-user/sql/kafka/rsa_key.p8

MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0XJdAFcF1eK+ei9fo6EJ
0NfFZWBv/NVtNa2vvd3XdRO3OeXdi9bY/Ai3XP6Jw3sowbLV21RaZfg/NINoW9kc
z6HVDK5oI8ddenghUYka9uduvuD+70BT9zRLz/qevc/eFCmCpuDnXown+LqW1q00
R/X2+SuLtyW+ZX9pjNqKddvW5SPmEh1Iw5J07K3gaxGqdAebIOLhy27egvKa/+Oj
ArA0WstW0Pj9TXdOULDK/8q8e/UqeIsdWSKi9iYz6wCXhTVkk8zIloZrjrWkybok
ZpXsySbLD5geqQ1x8Ju1fXRGquNTpBfI0JoruPcuMgsz3kBGjcu9IFPLyJ8VdXKL
FQIDAQAB
