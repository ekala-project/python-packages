{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "appimage";
  version = "4.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ssh-mitm";
    repo = "appimage";
    tag = finalAttrs.version;
    hash = "sha256-O+C/phCD0i/z9MCQg6er+RDER0uAcumbhrAAyxhIX4Y=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"uv_build>=0.12.7,<0.13"' '"hatchling"' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "hatchling.build"'
  '';

  build-system = [ hatchling ];

  # Module has no test
  doCheck = false;

  pythonImportsCheck = [ "appimage" ];

  meta = {
    description = "AppImage start scripts";
    homepage = "https://github.com/ssh-mitm/appimage";
    license = lib.licenses.gpl3Only;
  };
})
