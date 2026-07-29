{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  beautifulsoup4,
  compressed-rtf,
  ebcdic,
  olefile,
  red-black-tree-mod,
  rtfde,
  tzlocal,
}:

buildPythonPackage (finalAttrs: {
  pname = "extract-msg";
  version = "0.56.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "TeamMsgExtractor";
    repo = "msg-extractor";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Zp31WhQQMJlxg52AHsiqxyxqIy1BXpdBkyNIgg2V5aw=";
  };

  pythonRelaxDeps = [
    "beautifulsoup4"
    "ebcdic"
  ];

  build-system = [ setuptools ];

  dependencies = [
    beautifulsoup4
    compressed-rtf
    ebcdic
    olefile
    red-black-tree-mod
    rtfde
    tzlocal
  ];

  pythonImportsCheck = [ "extract_msg" ];

  meta = {
    description = "Extracts emails and attachments saved in Microsoft Outlook's .msg files";
    homepage = "https://github.com/TeamMsgExtractor/msg-extractor";
    license = lib.licenses.gpl3Only;
    maintainers = [ ];
  };
})
