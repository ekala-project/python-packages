{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pkgs,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "hwdata";
  version = "2.4.3-1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "xsuchy";
    repo = "python-hwdata";
    tag = "python-hwdata-${finalAttrs.version}";
    hash = "sha256-5bcdyCGv1sM8HThoSsvJe68LprDq0kI801F/aTH5FVs=";
  };

  nativeBuildInputs = [ setuptools ];

  patchPhase = ''
    substituteInPlace hwdata.py --replace "/usr/share/hwdata" "${pkgs.hwdata}/share/hwdata"
  '';

  pythonImportsCheck = [ "hwdata" ];

  meta = {
    description = "Python bindings to hwdata";
    homepage = "https://github.com/xsuchy/python-hwdata";
    license = lib.licenses.gpl2Plus;
  };
})
