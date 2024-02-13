# Android 푸시 알림 아이콘

### 아이콘 이미지 설정

- 이미지의 배경은 투명하게, 형태는 불투명한 흰색으로, 오로지 0x00000000과 0xFFFFFFFF의 두 색상만 사용해야 한다.
- 해상도 별 밉맵 이미지 생성
    - 규격 : https://arc.net/l/quote/xvdysosl
    - 생성기 : https://romannurik.github.io/AndroidAssetStudio/icons-notification.html#source.type=clipart&source.clipart=ac_unit&source.space.trim=1&source.space.pad=0&name=ic_stat_ac_unit
- android/app/src/main/res 폴더의 drawable, drawable-hdpi, drawable-mdpi, drawable-xhdpi, drawable-xxhdpi, drawable-xxxhdpi 폴더 각각에, 동일한 이름의 png 파일이 해상도 별로 존재해야 한다. (https://arc.net/l/quote/twsxtxlj)

### 아이콘 색상 지정

- res/values/styles.xml 수정
    ```xml
    <?xml version="1.0" encoding="utf-8"?>
    <resources>
        ...
        **<color name = "black">#000000</color>**
    </resources>
    ```
    
- AndroidManifest.xml 수정
    ```xml
    <manifest xmlns:android="http://schemas.android.com/apk/res/android"
        **xmlns:tools="http://schemas.android.com/tools"**
        package="com.example.app">
    
    	...
    
        <application ... >
            <!-- Set custom default icon. This is used when no icon is set for incomingnotification messages.
                See README(https://goo.gl/l4GJaQ) for more. -->
    	    <meta-data
                android:name="com.google.firebase.messaging.default_notification_icon"
                android:resource="@drawable/ic_stat_sotwo_symbol" />
            <!-- Set color used with incoming notification messages. This is used when no coloris set for the incoming
                notification message. See README(https://goo.gl/6BKBk7) for more. -->
            <meta-data
                android:name="com.google.firebase.messaging.default_notification_color"
                android:resource="@color/black"
    	    	tools:replace="android:resource"
            />

    			...
    ```