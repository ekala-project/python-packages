{ lib
, stdenv
, buildPythonPackage
, fetchPypi
, gnureadline
, pyperclip
, rich-argparse
, setuptools-scm
, wcwidth
,
}:

buildPythonPackage rec {
  pname = "cmd2";
  version = "3.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-bGNyobJs0Uu2IJZTyJ1zAP58FDno3KMPW2tv/bXyFPo=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    pyperclip
    rich-argparse
    wcwidth
  ]
  ++ lib.optional stdenv.hostPlatform.isDarwin gnureadline;

  pythonImportsCheck = [ "cmd2" ];

  meta = {
    description = "Enhancements for standard library's cmd module";
    homepage = "https://github.com/python-cmd2/cmd2";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
