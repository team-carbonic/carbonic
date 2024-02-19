part of '../main.dart';

/// 피그마 토큰 상 시스템화돼 있는 아이콘을 관리하는 class이다.
/// 피그마 토큰과 유사한 이름으로 작성하는 것을 원칙으로 한다.
/// 사이즈와 color(white 원칙)는 모두 통일된 형태로 관리하며, 이는 디자인 팀과 논의하여 결정한다.
/// 실제로 사용할 때에는 [SabSvg] class의 파라미터를 통해 사이즈와 색상을 조절한다.
class _SystemIcon {
  String get iconArrowSmallUp =>
      '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<g clip-path="url(#clip0_120_11393)">
<path d="M12 8.59998C12.23 8.59998 12.46 8.68997 12.64 8.85997L17.64 13.86C17.82 14.04 17.9 14.27 17.9 14.5C17.9 14.73 17.81 14.96 17.64 15.14C17.29 15.49 16.72 15.49 16.37 15.14L12.01 10.78L7.65 15.14C7.3 15.49 6.73 15.49 6.38 15.14C6.2 14.96 6.12 14.73 6.12 14.5C6.12 14.27 6.21 14.04 6.38 13.86L11.38 8.85997C11.56 8.67997 11.79 8.59998 12.02 8.59998H12Z" fill="white"/>
</g>
<defs>
<clipPath id="clip0_120_11393">
<rect width="24" height="24" fill="white"/>
</clipPath>
</defs>
</svg>
''';

  String get iconArrowSmallDown =>
      '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<g clip-path="url(#clip0_120_11394)">
<path d="M12 15.4C11.77 15.4 11.54 15.31 11.36 15.14L6.35998 10.14C6.17998 9.95997 6.09998 9.72997 6.09998 9.49997C6.09998 9.26997 6.18998 9.03997 6.35998 8.85997C6.70998 8.50997 7.27998 8.50997 7.62998 8.85997L11.99 13.22L16.35 8.85997C16.7 8.50997 17.27 8.50997 17.62 8.85997C17.8 9.03997 17.88 9.26997 17.88 9.49997C17.88 9.72997 17.79 9.95997 17.62 10.14L12.62 15.14C12.44 15.32 12.21 15.4 11.98 15.4H12Z" fill="white"/>
</g>
<defs>
<clipPath id="clip0_120_11394">
<rect width="24" height="24" fill="white"/>
</clipPath>
</defs>
</svg>
''';

  String get iconArrowSmallLeft =>
      '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<g clip-path="url(#clip0_120_11395)">
<path d="M14.5 6.09998C14.73 6.09998 14.96 6.18998 15.14 6.35998C15.32 6.52998 15.4 6.76998 15.4 6.99998C15.4 7.22998 15.31 7.45998 15.14 7.63998L10.78 12L15.14 16.36C15.32 16.54 15.4 16.77 15.4 17C15.4 17.23 15.31 17.46 15.14 17.64C14.79 17.99 14.22 17.99 13.87 17.64L8.86999 12.64C8.68999 12.46 8.60999 12.23 8.60999 12C8.60999 11.77 8.69999 11.54 8.86999 11.36L13.87 6.35998C14.05 6.17998 14.28 6.09998 14.51 6.09998H14.5Z" fill="white"/>
</g>
<defs>
<clipPath id="clip0_120_11395">
<rect width="24" height="24" fill="white"/>
</clipPath>
</defs>
</svg>
''';

  String get iconArrowSmallRight =>
      '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<g clip-path="url(#clip0_120_11396)">
<path d="M9.49998 17.9C9.26998 17.9 9.03997 17.81 8.85997 17.64C8.67997 17.47 8.59998 17.23 8.59998 17C8.59998 16.77 8.68997 16.54 8.85997 16.36L13.22 12L8.85997 7.63997C8.67997 7.45997 8.59998 7.22997 8.59998 6.99997C8.59998 6.76997 8.68997 6.53997 8.85997 6.35997C9.20997 6.00997 9.77998 6.00997 10.13 6.35997L15.13 11.36C15.31 11.54 15.39 11.77 15.39 12C15.39 12.23 15.3 12.46 15.13 12.64L10.13 17.64C9.94998 17.82 9.71997 17.9 9.48997 17.9H9.49998Z" fill="white"/>
</g>
<defs>
<clipPath id="clip0_120_11396">
<rect width="24" height="24" fill="white"/>
</clipPath>
</defs>
</svg>
''';

  String get btnCheckSelected =>
      '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<circle cx="12" cy="12" r="12" fill="#1C1C1C"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M10.7485 15.782H10.7365C10.4415 15.779 10.1665 15.66 9.96249 15.449L7.16849 12.548C6.93749 12.31 6.94449 11.93 7.18449 11.7C7.42149 11.469 7.80249 11.477 8.03149 11.716L10.7495 14.537L16.1505 9.175C16.3865 8.941 16.7665 8.942 16.9995 9.178C17.2325 9.413 17.2315 9.793 16.9965 10.026L11.5185 15.465C11.3105 15.67 11.0385 15.782 10.7485 15.782Z" fill="white"/>
</svg>
''';

  String get btnCheckDefault =>
      '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<circle cx="12" cy="12" r="11.5" fill="white" stroke="#C2C2C2"/>
</svg>
''';
}