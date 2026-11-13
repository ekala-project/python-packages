{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  gnureadline,
  prompt-toolkit,
  pyperclip,
  rich-argparse,
  setuptools-scm,
  wcwidth,
}:

buildPythonPackage (finalAttrs: {
  pname = "cmd2";
  version = "4.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-6O8/m/L7j3Ks3a+TS5fEnRTGrivnJxxUe5dZOr3qbB4=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    prompt-toolkit
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
  };
})
