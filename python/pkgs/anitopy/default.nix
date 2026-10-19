{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:
buildPythonPackage (finalAttrs: {
  pname = "anitopy";
  version = "2.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "igorcmoura";
    repo = "anitopy";
    tag = "v${finalAttrs.version}";
    hash = "sha256-xXEf7AJKg7grDmkKfFuC4Fk6QYFJtezClyfA3vq8TfQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "anitopy" ];

  meta = {
    description = "Python library for parsing anime video filenames";
    homepage = "https://github.com/igorcmoura/anitopy";
    license = lib.licenses.mpl20;
  };
})
