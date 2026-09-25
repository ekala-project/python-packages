{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  pytestCheckHook,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "infrared-protocols";
  version = "10.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "home-assistant-libs";
    repo = "infrared-protocols";
    tag = finalAttrs.version;
    hash = "sha256-nbZlCZBZRMsFWL062Q9ZoilEg/Xl/aqiQrgO7DmiHUI=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools>=78.1.1,<83.0" setuptools
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "infrared_protocols" ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  meta = {
    description = "Library to decode and encode infrared signals";
    homepage = "https://github.com/home-assistant-libs/infrared-protocols";
    license = lib.licenses.mit;
  };
})
