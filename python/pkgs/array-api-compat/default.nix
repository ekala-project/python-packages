{
  lib,
  config,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  meson-python,
}:

buildPythonPackage (finalAttrs: {
  pname = "array-api-compat";
  version = "1.15";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "data-apis";
    repo = "array-api-compat";
    tag = finalAttrs.version;
    hash = "sha256-z6B+lOYciT71Uz3Py9M/8x7R+8IZ46nd8i8AYot5Rlo=";
  };

  build-system = [
    meson-python
  ];

  pythonImportsCheck = [ "array_api_compat" ];

  meta = {
    description = "Compatibility layer for NumPy to support the Python array API";
    homepage = "https://data-apis.org/array-api-compat";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
