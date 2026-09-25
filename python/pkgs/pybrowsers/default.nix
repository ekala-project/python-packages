{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pybrowsers";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "roniemartinez";
    repo = "browsers";
    tag = finalAttrs.version;
    hash = "sha256-oYuPT/IQ3ev+YhqPwkPwa6oyiB+IYb7C9uVuQa0AW+A=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.10.11,<0.12.0"]' 'requires = ["setuptools"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "setuptools.build_meta"'
  '';

  build-system = [ setuptools ];

  # Tests want to interact with actual browsers
  doCheck = false;

  pythonImportsCheck = [ "browsers" ];

  meta = {
    description = "Python library for detecting and launching browsers";
    homepage = "https://github.com/roniemartinez/browsers";
    license = lib.licenses.mit;
  };
})
