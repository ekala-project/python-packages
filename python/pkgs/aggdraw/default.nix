{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  packaging,
  setuptools,
  pkgconfig,
  freetype,
  pkg-config,
}:

buildPythonPackage (finalAttrs: {
  pname = "aggdraw";
  version = "1.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pytroll";
    repo = "aggdraw";
    tag = "v${finalAttrs.version}";
    hash = "sha256-rBasRGdlM6/NsUd8+KsgHoZMsWhAhneSWjTeZ/QQZZ8=";
  };

  build-system = [
    packaging
    setuptools
    pkgconfig
  ];

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ freetype ];

  pythonImportsCheck = [ "aggdraw" ];

  meta = {
    description = "High quality drawing interface for PIL";
    homepage = "https://github.com/pytroll/aggdraw";
    license = lib.licenses.mit;
  };
})
