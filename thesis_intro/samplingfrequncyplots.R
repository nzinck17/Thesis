

library(tidyverse)

# library(gridExtra)
# library(grid)
# library(lattice)

#####################################
# Tributary

df_a <- data_frame(Parameter = c("Specific Conductance", "Turbidity", "Water Temperature", "E. coli", 
                                  "Mean UV254", "Ammonia", "Nitrate", "Total Phosphorus",
                                  "Total Kjeldahl Nitrogen"),
                   Type = "Tributary",
                 Quabbin = c(rep("Biweekly", 4), "Quarterly", "Variable", rep("Quarterly", 3)), # needs work
                 `Ware River` = c(rep("Biweekly", 4), "Quarterly", "Variable", rep("Quarterly", 3)), # needs work
                 Wachusett = c(rep("Weekly", 4), rep("Monthly", 4), "Variable"))

df_b <- data_frame(Parameter = c("Dissolved Oxygen", "Dissolved Oxygen Saturation", "pH",  "Calcium(II)", 
                               "Total Coliform (Colilert)", "Nitrite", 
                               "Alkalinity", "Fecal Coliform"),
                   Type = "Tributary",
                 Quabbin = c(rep("Biweekly", 6), rep("Variable", 2)),
                 `Ware River` = c(rep("Biweekly", 6), rep("Variable", 2)),
                 Wachusett = "None")

df_c <- data_frame(Parameter = c("Total Organic Carbon", "Total Suspended Solids", "Discharge"),
                   Type = "Tributary",
                   Quabbin = "None",
                   `Ware River` = "None",
                   Wachusett = c(rep("Monthly", 2), "Weekly"))


df <- rbind(df_a, df_b, df_c)

df1 <- gather(df, "Location", "Frequency", -(1:2))




df1$Watershed <- factor(df1$Watershed, levels = c("Quabbin", "Ware River", "Wachusett"))



p1 <- ggplot(df1, aes(x = Watershed, y = Parameter)) +
  geom_tile(aes(fill = Frequency), colour = "white", size = 2) +
  scale_fill_manual(limits = c("Weekly", "Biweekly", "Monthly", "Quarterly", "Variable", "None"),
                    values = c("dodgerblue4", "dodgerblue3", "steelblue2", "skyblue1","gray70", "gray90")) +
  #scale_x_discrete(position = "top") +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  ylab("") +
  xlab("") +
  ggtitle("Reservoir") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  #

# F:\Nick Zinck\Shiny Water Quality\GitHub\Thesis\thesis_intro
#ggplot2::ggsave("tributary.pdf", p1, width = 4, height = 5, units = c("in"))

###############################################################
# Reservoir


# One depth
DF_a <- data_frame(Parameter = c("E. Coli", "Fecal Coliform", "Calcium(II)"),
                   Type = "One Depth",
                   Quabbin = "None",
                   Wachusett = c(rep("Variable", 3)))

# Three depth
DF_b <- data_frame(Parameter = c("Alkalinity", "Ammonia", "Nitrate", "Total Kjeldahl Nitrogen", 
                                 "Total Phosphorus", "Silicone Dioxide", "Mean UV254"),
                   Type = "Three Depths",
                   Quabbin = c(rep("Monthly"), rep("Quarterly", 6)),
                   Wachusett = c(rep("Monthly", 6), rep("Quarterly", 1)))

DF_c <- data_frame(Parameter = c("Turbidity",  "Specific Conductance", "Total Coliform", "Fecal Coliform", "E. coli", "Mean UV254", 
                                 "Total Coliform (Colilert)", "Dissolved Silicone Dioxide"),
                   Type = "Three Depths",
                   Quabbin = c(rep("Monthly", 8)),
                   Wachusett = "None")

DF_d <- data_frame(Parameter = c("Dissolved Silica", "Total Suspended Solids"),
                   Type = "Three Depths",
                   Quabbin = "None",
                   Wachusett = c(rep("Monthly", 2)))


# Profile
DF_e <- data_frame(Parameter = c("Specific Conductance", "Water Temperature", "Dissolved Oxygen", "Dissolved Oxygen Saturation", 
                                 "pH", "Chlorophyll", "Blue Green Algae"),
                   Type = "Profile",
                   Quabbin = c(rep("Monthly", 5), c(rep("Variable", 2))),
                   Wachusett = c(rep("Monthly", 7)))

DF_f <- data_frame(Parameter = c("Turbidity", "Total Dissolved Solids"),
                   Type = "Profile",
                   Quabbin = "None",
                   Wachusett = c(rep("Monthly", 2)))



DF <- rbind(DF_a, DF_b, DF_c, DF_d, DF_e, DF_f)

DF$Type <- DF$Type %>% factor(levels = c("One Depth", "Three Depths", "Profile"))

DF1 <- gather(DF, "Location", "Frequency", -(1:2))

DF1$Location <- paste(DF1$Location, DF1$Type)

DF1$Type <- "Reservoir"




#df1 <- df1 %>% mutate(`Sampling Frequency and Type` = ifelse(Frequency == "None", "None", paste(Frequency, Type)))


p2 <- ggplot(DF1, aes(x = Watershed, y = Parameter)) +
  geom_tile(aes(fill = Frequency), colour = "white", size = 2) + #
  scale_fill_manual(limits = c("Weekly", "Biweekly", "Monthly", "Quarterly", "Variable", "None"),
                    values = c("dodgerblue4", "dodgerblue3", "steelblue2", "skyblue1","gray70", "gray90")) +
  
  facet_grid(Type~., scales = "free", space = "free") +
  #scale_x_discrete(position = "top") +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  ylab("") +
  xlab("") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Reservoir") +
  theme(legend.position="none")

# F:\Nick Zinck\Shiny Water Quality\GitHub\Thesis\thesis_intro
#ggplot2::ggsave("reservoir_sampling.pdf", p2, width = 4, height = 6.5, units = c("in"))


##########################################################



# lay <- rbind(c(1,1,1,2,2),
#              c(1,1,1,2,2),
#              c(1,1,1,2,2))
# p <- grid.arrange(p1,p2, layout_matrix = lay)

df_trib <- read_csv("TribSamplinPlan.csv")
df_res <- read_csv("ResSamplinPlan.csv")

df <- rbind(df_res, df_trib) %>% filter(!is.na(Parameter))


p <- ggplot(df, aes(x = Location, y = Parameter)) +
  geom_tile(aes(fill = Frequency), colour = "black") + #
  scale_fill_manual(limits = c("Weekly", "Biweekly", "Monthly", "Quarterly", "Variable"),
                    values = c("dodgerblue4", "dodgerblue3", "steelblue2", "lightskyblue1","gray70")) +
  
  facet_grid(.~Type, scales = "free", space = "free") +
  #scale_x_discrete(position = "top") +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  ylab("") +
  xlab("") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



ggplot2::ggsave("sampling_frequencies.pdf", p, width = 6, height = 7.5, units = c("in"))














