import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:sotwo/core/firebase/analytics/define.dart';
import 'package:sotwo/core/utility/logger/logger.dart';

part 'firebase_analytics_proxy.dart';

// TODO : GA 연동

/// ### 설명
/// - [AnalyticsManager]의 각 함수들은, 각 함수들의 주석 첮 줄에 명시된 이벤트에 대응된다.
/// - [_FirebaseAnalayticsProxy]의 함수들이 [FirebaseAnalytics]의 실제 이벤트 호출을 담당한다.
/// - 구체적인 이벤트 내용은 아래 링크의 스프레드 시트를 확인한다.
///   https://docs.google.com/spreadsheets/d/17-2nWmnIUmkgcjfgxxFM6tFbucEDf81QnW0U-zsl2Go/edit#gid=0
///
/// ### 이벤트 호출 규칙
/// - 각 함수명은 호출 시점을 암시하고 있으며, 그 호출 시점의 타입들은 아래와 같다.
///   - on~Tapped: 해당 터치 영역이 눌린 직후
///   - onPre~: 해당 프로세스가 시작되기 직전
///     - 페이지 진입 이벤트의 경우, `initState`에서 호출한다.
///   - onPost~: 해당 프로세스가 완료된 직후
///     - 네트워크 통신이 필요한 프로세스의 경우, 해당 프로세스가 서버에서 성공했을 때만 호출한다.
/// - 보통의 순서는 아래와 같을 것이다.
///   - Tapped -> Pre -> (process) -> Post
/// - 이벤트 호출 함수들은 모두, 예외를 외부로 던지지 않도록 한다.
///   따라서, 이벤트 호출을 추가할 경우, [_FirebaseAnalayticsProxy]의 실제 이벤트 함수들을
///   [AnalyticsManager._catchError]로 감싸서 호출한다.
///
class AnalyticsManager {
  static Future<void> initialize() async {
    await _FirebaseAnalayticsProxy.initialize();
  }

  /// sign_up
  static void onPostRegistered({
    required final String userId,
  }) {
    _FirebaseAnalayticsProxy.setUserId(id: userId);
    _FirebaseAnalayticsProxy.logSignUp(
      signUpMethod: 'phone_number',
    );
  }

  /// 이벤트 없음
  static void onPostUnregistered() {
    _FirebaseAnalayticsProxy.setUserId(id: null);
  }

  /// login
  /// 최초 회원가입을 통한 로그인 시에도 호출 필요
  static void onPostLogin({
    required final String userId,
  }) {
    _FirebaseAnalayticsProxy.setUserId(id: userId);
    _FirebaseAnalayticsProxy.logLogin(
      loginMethod: 'phone_number',
    );
  }

  /// account_link
  static void onPostAccountLinked({
    required final FinancialCorporation corporation,
  }) {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'account_link',
      parameters: {
        'category': corporation.value,
      },
    );
  }

  /// bias_clear
  static void onInvestmentBiasAnalysisConfirmButtonTapped({
    required final InvestmentBiasGrade grade,
  }) {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'bias_clear',
      parameters: {
        'value': grade.value,
      },
    );
  }

  /// home
  static void onPreHomePageLoadedFirstTime() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'home',
    );
  }

  /// home_button
  static void onPreHomePageLoadedWithHomeTabButton() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'home_button',
    );
  }

  /// search_button
  static void onPreSearchPageLoadedWithSearchTabButton() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'search_button',
    );
  }

  /// magazine_button
  static void onPreMagazinePageLoadedWithMagazineTabButton() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'magazine_button',
    );
  }

  /// magazine_view
  static void onPreSpecificMagazinePageLoaded({
    required final String title,
  }) {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'magazine_view',
      parameters: {
        'title': title,
      },
    );
  }

  /// my_button
  static void onPreMyPageLoadedWithMyTabButton() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'my_button',
    );
  }

  /// subs_view
  static void onPrePublicOfferingDetailPageLoaded({
    required final String artistName,
    required final String productName,
  }) {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'subs_view',
      parameters: {
        'artist': artistName,
        'product': productName,
      },
    );
  }

  /// subs_start
  static void onPublicOfferingApplyButtonTapped({
    required final String artistName,
    required final String productName,
  }) {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'subs_start',
      parameters: {
        'artist': artistName,
        'product': productName,
      },
    );
  }

  /// subs_clear
  static void onPostPublicOfferingApplication({
    required final String artistName,
    required final String productName,
  }) {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'subs_clear',
      parameters: {
        'artist': artistName,
        'product': productName,
      },
    );
  }

  /// subs_cancel
  static void onPostPublicOfferingApplicationCanceled({
    required final String artistName,
    required final String productName,
  }) {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'subs_cancel',
      parameters: {
        'artist': artistName,
        'product': productName,
      },
    );
  }

  /// subs_share
  static void onPublicOfferingShareButtonTapped({
    required final String artistName,
    required final String productName,
  }) {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'subs_share',
      parameters: {
        'artist': artistName,
        'product': productName,
      },
    );
  }

  /// order_history
  static void onPreOrderHistoryPageLoaded() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'order_history',
    );
  }

  /// order_history_detail
  static void onPreOrderDetailPageLoaded({
    required final OrderStatus status,
  }) {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'order_history_detail',
      parameters: {
        'status': status.value,
      },
    );
  }

  /// my_asset_clear
  static void onPreWorkInPossessionPageLoaded() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'my_asset_clear',
    );
  }

  /// my_asset_clear_detail
  static void onPreWorkInPossessionDetailPageLoaded({
    required final String artistName,
    required final String productName,
  }) {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'my_asset_clear_detail',
      parameters: {
        'artist': artistName,
        'product': productName,
      },
    );
  }

  /// event_clear
  static void onEventApplicationButtonTapped({
    required final String eventTitle,
  }) {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'event_clear',
      parameters: {
        'title': eventTitle,
      },
    );
  }

  /// home_history
  static void onPrePublicOfferingHistoryPageLoaded() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'home_history',
    );
  }

  /// my_profile
  static void onProfileButtonTapped() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'my_profile',
    );
  }

  /// home_now_subs
  static void onInvestmentConditionButtonTapped() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'home_now_subs',
    );
  }

  /// home_now_asset
  static void onHoldingAssetButtonTapped() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'home_now_asset',
    );
  }

  /// home_now_account
  static void onAccountButtonTapped() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'home_now_account',
    );
  }

  /// search_clear
  static void onPostSearched({
    required final String searchWord,
  }) {
    _FirebaseAnalayticsProxy.logSearch(
      searchTerm: searchWord,
    );
  }

  /// logout
  static void onPostLogout() {
    _FirebaseAnalayticsProxy.setUserId(
      id: null,
    );
  }

  /// bias_start
  static void onInvestmentBiasAnalysisStartButtonTapped() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'bias_start',
    );
  }

  /// mkt_banner
  static void onMarketingBannerButtonTapped({
    required final String title,
  }) {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'mkt_banner',
      parameters: {
        'title': title,
      },
    );
  }

  /// magazine_more
  static void onMagazineMoreButtonTapped() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'magazine_more',
    );
  }

  /// my_document
  static void onMyTabPublicOfferingButtonTapped() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'my_document',
    );
  }

  /// subs_document
  static void onDetailPublicOfferingButtonTapped() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'subs_document',
    );
  }

  /// att_dec
  /// iOS 사용자만 해당
  static void onAttDeclined() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'att_dec',
    );
  }

  /// att_acc
  /// iOS 사용자만 해당
  static void onAttAccepted() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'att_acc',
    );
  }

  /// feed
  static void onPreFeedPageLoadedWithFeedTabButton() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'feed',
    );
  }

  /// announce
  static void onNoticeButtonTapped() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'announce',
    );
  }

  /// my_banner
  static void onMyTabBannerButtonTapped({
    required final int id,
  }) {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'my_banner',
      parameters: {
        'id': id,
      },
    );
  }

  /// announce_view
  static void onPreSpecificNoticePageLoaded() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'announce_view',
    );
  }

  /// noti_view
  static void onNotificationButtonTapped() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'noti_view',
    );
  }

  /// noti_view_detail
  static void onSpecificNotificationTapped() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'noti_view_detail',
    );
  }

  /// subs_document_view
  static void onPostInvestmentDocumentsLoaded() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'subs_document_view',
    );
  }

  // my_history
  static void onPreInvestmentHistoryCardListPageLoaded() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'my_history',
    );
  }

  // my_subslist
  static void onPrePublicOfferingCardListPageLoaded() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'my_subslist',
    );
  }

  // my_own
  static void onPreOwningCardListPageLoaded() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'my_own',
    );
  }

  // my_reimburse
  static void onPreReimbursedCardListPageLoaded() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'my_reimburse',
    );
  }

  // my_asset
  static void onPreAssetStatusCardListPageLoaded() {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'my_asset',
    );
  }

  // other_works
  // ! 보류
  static void onPreSimilarWorkPageLoaded() {}

  // notice_banner
  static void onHomePageNoticeBannerSectionCardTapped({
    required final String title,
  }) {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'notice_banner',
      parameters: {
        'title': title,
      },
    );
  }

  // my_detail
  static void onAssetCardTapped({
    required final String listPageName,
    required final String saleTypeLabel,
    required final String title,
  }) {
    _FirebaseAnalayticsProxy.logEvent(
      name: 'my_detail',
      parameters: {
        'pre': listPageName,
        'label': saleTypeLabel,
        'status': title,
      },
    );
  }
}
