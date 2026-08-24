{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyroute2";
  version = "0.9.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "svinota";
    repo = "pyroute2";
    tag = finalAttrs.version;
    hash = "sha256-ZseZQFiR+btDsR+ozcd8DBp0vsNTb6tIzaArQfOk7CI=";
  };

  build-system = [ setuptools ];

  # Requires root privileges, https://github.com/svinota/pyroute2/issues/778
  pythonImportsCheck = [
    "pyroute2"
  ];

  postPatch = ''
    patchShebangs util
    make VERSION
  '';

  meta = {
    description = "Python Netlink library";
    homepage = "https://github.com/svinota/pyroute2";
    license = with lib.licenses; [
      asl20 # or
      gpl2Plus
    ];
    maintainers = [ ];
    platforms = lib.platforms.unix;
  };
})
