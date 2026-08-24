{ stdenv
, lib
, buildPythonPackage
, fetchurl
, python
, apr
, aprutil
, pycxx
, subversion
,
}:

buildPythonPackage rec {
  pname = "pysvn";
  version = "1.9.25";
  pyproject = false;

  src = fetchurl {
    url = "mirror://sourceforge/project/pysvn/pysvn/V${version}/pysvn-${version}.tar.gz";
    hash = "sha256-M9LzUr/6FZSUWFQdGM6Ew1/ySE5C/Q7cNXi+jGa+JdY=";
  };

  patches = [ ./replace-python-first.patch ];

  buildInputs = [
    subversion
    apr
    aprutil
  ];
  preConfigure = ''
    cd Source
    ${python.pythonOnBuildForHost.interpreter} setup.py backport
    ${python.pythonOnBuildForHost.interpreter} setup.py configure \
      --apr-inc-dir=${apr.dev}/include \
      --apu-inc-dir=${aprutil.dev}/include \
      --pycxx-dir=${pycxx.dev}/include \
      --svn-inc-dir=${subversion.dev}/include/subversion-1 \
      --pycxx-src-dir=${pycxx.dev}/src \
      --apr-lib-dir=${apr.out}/lib \
      --svn-lib-dir=${subversion.out}/lib \
      --svn-bin-dir=${subversion.out}/bin
  '';

  pythonImportsCheck = [ "pysvn" ];

  installPhase = ''
    dest=$(toPythonPath $out)/pysvn
    mkdir -p $dest
    cp pysvn/__init__.py $dest/
    cp pysvn/_pysvn*.so $dest/
    mkdir -p $out/share/doc
    mv -v ../Docs $out/share/doc/pysvn-${version}
    rm -v $out/share/doc/pysvn-${version}/generate_cpp_docs_from_html_docs.py
  '';

  meta = {
    description = "Python bindings for Subversion";
    homepage = "https://pysvn.sourceforge.io/";
    license = lib.licenses.asl20;
    maintainers = [ ];
    # g++: command not found
    broken = stdenv.hostPlatform.isDarwin;
  };
}
