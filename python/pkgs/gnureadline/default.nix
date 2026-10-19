{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  isPyPy,
  pkgs,
}:

buildPythonPackage (finalAttrs: {
  version = "8.3.3";
  pyproject = true;
  pname = "gnureadline";
  disabled = isPyPy;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-CXI5K9LzEkTi2YEXgkb+i3Kch2ZFT9rrJ1lGrEe36f0=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pkgs.ncurses ];
  patchPhase = ''
    substituteInPlace setup.py --replace "/bin/bash" "${pkgs.bash}/bin/bash"
  '';

  meta = {
    description = "Standard Python readline extension statically linked against the GNU readline library";
    homepage = "https://github.com/ludwigschwardt/python-gnureadline";
    license = lib.licenses.gpl3;
  };
})
