{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, bidict
, packaging
, typing-extensions
,
}:

buildPythonPackage rec {
  pname = "desktop-notifier";
  version = "6.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "SamSchott";
    repo = "desktop-notifier";
    tag = "v${version}";
    hash = "sha256-VVbBKhGCtdsNOfRJPpDk9wwsTtdEwbTSZjheXLydO70=";
  };

  build-system = [ setuptools ];

  dependencies = [
    bidict
    packaging
    typing-extensions
  ];
  # no tests available, do the imports check instead
  pythonImportsCheck = [ "desktop_notifier" ];

  meta = {
    description = "Python library for cross-platform desktop notifications";
    homepage = "https://github.com/samschott/desktop-notifier";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
