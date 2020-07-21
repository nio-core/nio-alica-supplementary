-- premake5.lua

workspace "alica-supplementary"
   configurations { "Debug", "Release" }

project "alica_capnzero_proxy"
   kind "StaticLib"
   language "C++"
   cppdialect "C++14"
   targetdir "bin/%{cfg.buildcfg}"

   libdirs { 
      os.findlib("uuid")
     }

  --links { "uuid" }

  linkoptions { 
   "../../alica/alica_engine/bin/Debug/libalica_engine.a",
   "../../essentials/system_config/bin/Debug/libsystem_config.a", 
   "../../essentials/fsystem/bin/Debug/libfsystem.a",
   --"../../alica/alica_solver_interface/bin/Debug/lialica_solver_interface.a",
   "../../essentials/id_manager/bin/Debug/libid_manager.a",
   "../../capnzero/capnzero/bin/Debug/libcapnzero.a",
   "../../capnzero/id_capnzero/bin/Debug/libid_capnzero.a",
   "../../libzmq/cmake-build/lib/libzmq.a",
   --"../../capnproto/c++/.libs/libcapnp.a",
   --"../../capnproto/c++/.libs/libkj.a",
   --"../../yaml-cpp/build/libyaml-cpp.a",
   }

   includedirs {
      "include", 
      "../../alica/alica_engine/include",
      "../../essentials/system_config/include" ,
      "../../essentials/fsystem/include" ,

      "../../alica/alica_solver_interface/include" ,
      "../../alica/alica_common_config/include" ,
      
      -- remove me
      "../../essentials/event_handling/include" ,
      
      "../../essentials/id_manager/include" , 
      "../../capnzero/capnzero/include" ,
      "../../capnzero/id_capnzero/include" ,
      "../../libzmq/include",
      "../../capnproto/c++/src",
      --"../../yaml-cpp/include",
   }
   
   files {
      "include/**.h", 
      "**.c++", 
      "src/**.cpp",
      "include/alica_capnz_msg/PlanTreeInfo.capnp.c++"
   }

   excludes {
      --"include/alica_capnz_msg/**",
   }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"  

   filter { "files:**.c++" }
    compileas "C++"
--       # File sets
--       # #############################################
      
--       OBJECTS :=
      
--       OBJECTS += $(OBJDIR)/AlicaCapnzeroCommunication.o
--       OBJECTS += $(OBJDIR)/RecieverTest.o
--       OBJECTS += $(OBJDIR)/SenderTest.o
--       OBJECTS += $(OBJDIR)/PlanTreeInfo.capnp.o
--       OBJECTS += $(OBJDIR)/RoleSwitch.capnp.o
--       OBJECTS += $(OBJDIR)/AlicaEngineInfo.capnp.o
--       OBJECTS += $(OBJDIR)/AllocationAuthorityInfo.capnp.o
--       OBJECTS += $(OBJDIR)/SolverResult.capnp.o
--       OBJECTS += $(OBJDIR)/SyncReady.capnp.o
--       OBJECTS += $(OBJDIR)/S


-- # File Rules
-- # #############################################

--    $(OBJDIR)/%.capnp.o: include/alica_capnz_msg/%.capnp.c++
-- 	@echo $(notdir $<)
-- 	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"