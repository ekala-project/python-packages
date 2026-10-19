{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pygments,
  six,
  wcwidth,
  pytestCheckHook,
  pyte,
  ptyprocess,
  pexpect,
}:

buildPythonPackage rec {
  pname = "lineedit";
  version = "0.1.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "randy3k";
    repo = "lineedit";
    tag = "v${version}";
    sha256 = "fq2NpjIQkIq1yzXEUxi6cz80kutVqcH6MqJXHtpTFsk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pygments
    six
    wcwidth
  ];

  nativeCheckInputs = [
    pytestCheckHook
    pyte
    pexpect
    ptyprocess
  ];

  pythonImportsCheck = [ "lineedit" ];

  meta = {
    description = "Readline library based on prompt_toolkit which supports multiple modes";
    homepage = "https://github.com/randy3k/lineedit";
    license = lib.licenses.mit;
  };
}
