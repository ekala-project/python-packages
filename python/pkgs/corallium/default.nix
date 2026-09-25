{
  beartype,
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  setuptools,
  rich,
  typing-extensions,
}:
buildPythonPackage rec {
  pname = "corallium";
  version = "2.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "KyleKing";
    repo = "corallium";
    tag = version;
    hash = "sha256-BtePG2XcukAytbNyIfH3rBesx7nu7J1TLtfbzZO37Os=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.9.26,<2.0"]' 'requires = ["setuptools"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "setuptools.build_meta"' \
      --replace-fail "'corallium>=2.0.1'," ""
  '';

  build-system = [
    setuptools
  ];

  dependencies = [
    beartype
    rich
    typing-extensions
  ];

  meta = {
    description = "Shared functionality for calcipy-ecosystem";
    homepage = "https://corallium.kyleking.me";
    license = lib.licenses.mit;
  };
}
