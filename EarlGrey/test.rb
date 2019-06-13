  allf = Dir.glob("**/*.{m,h}")
  allh = Dir.glob("**/*.h")
  
  alltestf = Dir.glob("Tests/**/*.{m,h}")
  alltesth = Dir.glob("Tests/**/*.h")
  
  appff = Dir.glob("AppFramework/**/*.m")
  
  sour = (allf - alltestf) - appff
  print(sour)
