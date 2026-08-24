{
  lib,
  buildPythonPackage,
  pythonAtLeast,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  python,
  cocotb-bus,
  find-libpython,
  stdenv,
}:

buildPythonPackage rec {
  pname = "cocotb";
  version = "2.0.1";
  format = "setuptools";

  # RuntimeError: cocotb 2.0.1 only supports a maximum Python version of 3.13.
  # You can suppress this error by defining the environment variable COCOTB_IGNORE_PYTHON_REQUIRES
  # There is no guarantee this will work and no support will be provided.
  disabled = pythonAtLeast "3.14";

  # pypi source doesn't include tests
  src = fetchFromGitHub {
    owner = "cocotb";
    repo = "cocotb";
    tag = "v${version}";
    hash = "sha256-LXQNqFlvP+WBaDGWPs5+BXBtW2dhDu+v+7lR/AMG21M=";
  };

  nativeBuildInputs = [ setuptools-scm ];

  buildInputs = [ setuptools ];
  propagatedBuildInputs = [ find-libpython ];

  postPatch = ''
    patchShebangs bin/*.py

    # POSIX portability (TODO: upstream this)
    for f in \
      cocotb/share/makefiles/Makefile.* \
      cocotb/share/makefiles/simulators/Makefile.*
    do
      substituteInPlace $f --replace 'shell which' 'shell command -v'
    done

    # remove circular dependency cocotb-bus from setup.py
    substituteInPlace setup.py --replace "'cocotb-bus<1.0'" ""
  '';

  # cocotb uses dlopen so that it's dynamic libraries are python version agnostic.
  # Here we patch its dynamic libraries to make sure the correct libpython is found and used.
  preFixup = lib.optionalString stdenv.hostPlatform.isLinux ''
    for lib in $out/lib/python*/site-packages/cocotb/libs/*.so; do
      patchelf --add-rpath ${python}/lib --add-needed libpython3.so $lib
    done
  '';

  pythonImportsCheck = [ "cocotb" ];

  meta = {
    description = "Coroutine based cosimulation library for writing VHDL and Verilog testbenches in Python";
    mainProgram = "cocotb-config";
    homepage = "https://github.com/cocotb/cocotb";
    license = lib.licenses.bsd3;
    broken = stdenv.hostPlatform.isDarwin;
    maintainers = [ ];
  };
}
