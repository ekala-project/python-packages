{
  buildPythonPackage,
  python,
  fetchFromGitHub,
  lib,
  requests,
  pyyaml,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "naked";
  version = "0.1.32";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "chrissimpkins";
    repo = "naked";
    rev = "v${version}";
    hash = "sha256-KhygnURFggvUTR9wwWtORtfQES8ANd5sIaCONvIhfRM=";
  };

  postPatch = ''
    # fix hardcoded absolute paths
    substituteInPlace tests/test_SYSTEM*.py \
      --replace-fail /Users/ces/Desktop/code/naked/tests/ "$PWD"/tests/
    substituteInPlace lib/Naked/toolshed/c/*.c \
      --replace-fail /Users/ces/Desktop/code/naked/lib/ $out/${python.sitePackages}/
  '';

  nativeBuildInputs = [
    wheel
    setuptools
  ];

  propagatedBuildInputs = [
    requests
    pyyaml
  ];

  pythonImportsCheck = [ "Naked" ];

  meta = {
    description = "Python command line application framework";
    homepage = "https://github.com/chrissimpkins/naked";
    downloadPage = "https://github.com/chrissimpkins/naked/tags";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
