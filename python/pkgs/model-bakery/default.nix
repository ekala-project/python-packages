{
  lib,
  buildPythonPackage,
  django,
  fetchFromGitHub,
  pytest-django,
  uv-build,
}:

buildPythonPackage (finalAttrs: {
  pname = "model-bakery";
  version = "1.23.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "model-bakers";
    repo = "model_bakery";
    tag = finalAttrs.version;
    hash = "sha256-W5n/L5D64OCCZkVi1IFHNl/mIR1EW6PIVuvmM78kq78=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "uv_build>=0.9.26,<0.10.0" "uv_build"
  '';

  build-system = [ uv-build ];

  dependencies = [ django ];
  pythonImportsCheck = [ "model_bakery" ];

  meta = {
    description = "Object factory for Django";
    homepage = "https://github.com/model-bakers/model_bakery";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
