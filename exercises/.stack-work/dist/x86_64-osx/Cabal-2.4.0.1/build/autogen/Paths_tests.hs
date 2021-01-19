{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_tests (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/joonaskinnunen/Koodit/Haskell-Functional-Programming-I/exercises/.stack-work/install/x86_64-osx/4b7307ba25ba6b9160bc665ac2dc8195aece51a18a3d6947f0f83251b46770f8/8.6.5/bin"
libdir     = "/Users/joonaskinnunen/Koodit/Haskell-Functional-Programming-I/exercises/.stack-work/install/x86_64-osx/4b7307ba25ba6b9160bc665ac2dc8195aece51a18a3d6947f0f83251b46770f8/8.6.5/lib/x86_64-osx-ghc-8.6.5/tests-0.0.1-5NBTdhyg6zF25kUh170v2I"
dynlibdir  = "/Users/joonaskinnunen/Koodit/Haskell-Functional-Programming-I/exercises/.stack-work/install/x86_64-osx/4b7307ba25ba6b9160bc665ac2dc8195aece51a18a3d6947f0f83251b46770f8/8.6.5/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/joonaskinnunen/Koodit/Haskell-Functional-Programming-I/exercises/.stack-work/install/x86_64-osx/4b7307ba25ba6b9160bc665ac2dc8195aece51a18a3d6947f0f83251b46770f8/8.6.5/share/x86_64-osx-ghc-8.6.5/tests-0.0.1"
libexecdir = "/Users/joonaskinnunen/Koodit/Haskell-Functional-Programming-I/exercises/.stack-work/install/x86_64-osx/4b7307ba25ba6b9160bc665ac2dc8195aece51a18a3d6947f0f83251b46770f8/8.6.5/libexec/x86_64-osx-ghc-8.6.5/tests-0.0.1"
sysconfdir = "/Users/joonaskinnunen/Koodit/Haskell-Functional-Programming-I/exercises/.stack-work/install/x86_64-osx/4b7307ba25ba6b9160bc665ac2dc8195aece51a18a3d6947f0f83251b46770f8/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "tests_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "tests_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "tests_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "tests_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tests_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "tests_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
