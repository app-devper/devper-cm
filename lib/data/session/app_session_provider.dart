abstract class AppSessionProvider {

  String getClientId();

  void setClientId(String clientId);

  String getHostApp();

  void setHostApp(String hostApp);

  String getHostUm();

  void setHostUm(String hostUm);

  String getAccessToken();

  void setAccessToken(String accessToken);

  String getLocale();

  void setLocale(String locale);


  void clear();
}
