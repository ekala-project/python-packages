{
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  lib,
  pytz,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "l18n";
  version = "2021.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-GVbokNZz0XE1zCCRMlPBVPa8HAAmbCK31QPMGlpC2Eg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pytz
    six
  ];

  # tests are not included in sdist and building from source is none trivial

  pythonImportsCheck = [ "l18n" ];

  meta = {
    description = "Locale internationalization package";
    homepage = "https://github.com/tkhyn/l18n";
    license = lib.licenses.mit;
  };
})
