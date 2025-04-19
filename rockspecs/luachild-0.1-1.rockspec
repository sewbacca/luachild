package = "luachild"
version = "0.1-1"
source = {
   url = "git://github.com/sewbacca/luachild",
   tag = "v0.1",
   branch = "fix-luajit-compilation"
}
description = {
   summary = "Spawn sub-processes and communicate with them through pipes.",
   detailed = [[
Luachild is a lua module to spawn system processes and perform basic
communication with them, i.e. pipes and environment variables set. It is
compatible with lua 5.3 and luajit 2.1 and it works under windows and any os
with posix spawn+environ api (e.g. linux). The code was extracted by the
LuaDist "Ex" API implementation 2007.]],
   homepage = "https://github.com/pocomane/luachild",
   license = "MIT"
}
supported_platforms = {
   "unix",
   "windows"
}
dependencies = {
   "lua >= 5.1"
}
build = {
   platforms = {
      unix = {
         modules = {
            luachild = {
               defines = {
                  "USE_POSIX"
               },
               incdirs = {
                  "./"
               },
               sources = {
                  "luachild_common.c",
                  "luachild_lua_5_3.c",
                  "luachild_luajit_2_1.c",
                  "luachild_posix.c",
                  "luachild_windows.c"
               }
            }
         },
         type = "builtin"
      },
      windows = {
         modules = {
            luachild = {
               defines = {
                  "USE_WINDOWS"
               },
               incdirs = {
                  "./"
               },
               sources = {
                  "luachild_common.c",
                  "luachild_lua_5_3.c",
                  "luachild_luajit_2_1.c",
                  "luachild_posix.c",
                  "luachild_windows.c"
               }
            }
         },
         type = "builtin"
      }
   }
}
