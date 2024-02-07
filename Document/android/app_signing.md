# Android App Sigining

### release 키 해시 조회(SHA-1, SHA-256)

```
keytool -list -v -keystore {.jks or .keystore} -alias {alias}
```

### Etc.

- SHA-1 → base64
    
    ```
    echo 6B:A1:29:D9:68:5B:D3:87:67:6A:D6:43:03:E1:5A:03:22:60:9B:K8 | xxd -r -p | openssl base64
    ```
    [Google Play App Signing - KeyHash Mismatch](https://stackoverflow.com/questions/44798378/google-play-app-signing-keyhash-mismatch)
    
- debug.keystore의 기본 비밀전호는 ‘android’이다.