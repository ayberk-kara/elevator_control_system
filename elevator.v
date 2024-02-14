`timescale 1ns / 1ps

module elevator(

input clk_50hz, rst,

floor_0_p,
floor_1_p,
floor_2_p,
floor_3_p,
floor_4_p,

direction_1,
direction_2,
direction_3,

floor_0_d,
floor_1_d,
floor_2_d,
floor_3_d,
floor_4_d,

output led_inside_0,
led_inside_1,
led_inside_2,
led_inside_3,
led_inside_4,

led_outside_0,
led_outside_1,
led_outside_2,
led_outside_3,
led_outside_4,

led_busy,

reg [7:0] a,b,c,d,e,f,g,p
);

    reg Cleared=1;
    reg Pathway=0,PathwayAnalyzed=0,ConcurrentP=0;
    reg kat0,kat1,kat2,kat3,kat4;
    reg [2:0] kat=0;
    reg [4:0]inreg=0;
    assign led_inside_0 =inreg[0]; 
    assign led_inside_1 =inreg[1]; 
    assign led_inside_2 =inreg[2]; 
    assign led_inside_3 =inreg[3]; 
    assign led_inside_4 =inreg[4]; 
    reg [9:0] decelerate=0;
    reg [2:0] pressed=7,sevenD=7,somewhere_in_M=7,Last_Point=7;
    reg [4:0]oreg=0;
    assign led_outside_0 = oreg[0]; 
    assign led_outside_1 = oreg[1]; 
    assign led_outside_2 = oreg[2]; 
    assign led_outside_3 = oreg[3]; 
    assign led_outside_4 = oreg[4]; 
    
    
    
    
    always @ (posedge clk_50hz)
        begin
            kat0<=floor_0_d;
			
            kat1<=floor_1_d;
			
            kat2<=floor_2_d;
			
            kat3<=floor_3_d;
			
            kat4<=floor_4_d;
			
            if(rst==0)
                begin
                    ConcurrentP<=0;
					
                    sevenD<=7;
					
                    kat<=0;
					
                    PathwayAnalyzed<=0;
					
                    decelerate<=1;
					
                    pressed<=7;
					
                    Cleared<=1;
					
                    Pathway<=0;
					
                    somewhere_in_M<=7;
					
                    Last_Point<=7;
                end
            else
                begin
                   							
					p<=8'b11111111;
					
					a[7]<=1;
					
					b[7]<=1;
					
					c[7]<=1;
					
					d[7]<=1;
					
					e[7]<=1;
					
					f[7]<=1;
					
					g[7]<=0;


					a[6]<=1;
					
					b[6]<=1;
					
					c[6]<=1;
					
					d[6]<=1;
					
					e[6]<=1;
					
					f[6]<=1;
					
					g[6]<=0;
					
					if(Cleared)
					   begin
                            a[5]<=1;
							
                            b[5]<=0;
							
                            c[5]<=0;
							
                            d[5]<=1;
							
                            e[5]<=1;
							
                            f[5]<=1;
							
                            g[5]<=1;					   
					   end
					else if(Pathway)
					   begin
                            a[5]<=1;
							
                            b[5]<=0;
							
                            c[5]<=0;
							
                            d[5]<=0;
							
                            e[5]<=0;
							
                            f[5]<=1;
							
                            g[5]<=0;					   
					   end	
					else
					   begin
                            a[5]<=1;
							
                            
							b[5]<=0;
                            
							c[5]<=0;
                            
							d[5]<=0;
                            
							e[5]<=0;
                            
							f[5]<=0;
                            
							g[5]<=1;					   
					   end						   
				

					 if(Cleared)
					   begin
                            a[4]<=1;
                            
							b[4]<=0;
                            
							c[4]<=0;
                            
							d[4]<=0;
                            
							e[4]<=0;
                            
							f[4]<=1;
                            
							g[4]<=0;					   
					   end							
					 else if(Pathway)
					   begin
                            a[4]<=0;
							
                            
							b[4]<=0;
                            
							c[4]<=0;
                            
							d[4]<=0;
                            
							e[4]<=0;
                            
							f[4]<=0;
                            
							g[4]<=1;					   
					   end									
				    else 
					   begin
                            a[4]<=0;
                            
							b[4]<=0;
                            
							c[4]<=1;
                            
							d[4]<=1;
                            
							e[4]<=0;
                            
							f[4]<=0;
                            
							g[4]<=0;					   
					   end
					
					a[3]<=0;
					
					b[3]<=1;
					
					c[3]<=1;
					
					d[3]<=1;
					
					e[3]<=0;
					
					f[3]<=0;
					
					g[3]<=0;
					
					
					a[2]<=1;
					
					b[2]<=1;
					
					c[2]<=1;
					
					d[2]<=0;
					
					e[2]<=0;
					
					f[2]<=0;
					
					g[2]<=1;					
					

					
					
					a[1]<=1;
					
					b[1]<=1;
					
					c[1]<=1;
					
					d[1]<=1;
					
					e[1]<=1;
					
					f[1]<=1;
					
					g[1]<=0;					
					
					if(kat==0)
					   begin
                            
							a[0]<=0;
                            
							b[0]<=0;
                            
							c[0]<=0;
                            
							d[0]<=0;
                            
							e[0]<=0;
                            
							f[0]<=0;
                            
							g[0]<=1;						   
					   end
					else if(kat==1)
					   begin
                            a[0]<=1;
                            
							b[0]<=0;
                            
							c[0]<=0;
                            
							d[0]<=1;
                            
							e[0]<=1;
                            
							
							f[0]<=1;
                            
							g[0]<=1;						   
					   end
					else if(kat==2)
					   begin
                            a[0]<=0;
                            
							b[0]<=0;
                            
							c[0]<=1;
                            
							d[0]<=0;
                            
							e[0]<=0;
                            
							f[0]<=1;
                            
							g[0]<=0;						   
					   end
					else if(kat==3)
					   begin
                            a[0]<=0;
                            
							b[0]<=0;
                            
							c[0]<=0;
                            
							d[0]<=0;
                            
							e[0]<=1;
                            
							f[0]<=1;
                            
							g[0]<=0;						   
					   end
					else
					   begin
                            a[0]<=1;
                            
							b[0]<=1;
                            
							c[0]<=0;
                            
							d[0]<=1;
                            
							e[0]<=1;
                            
							f[0]<=0;
                            
							g[0]<=0;						   
					   end					   					   					   					   
					   		
					   		
					   		
					   				    			
                    if(floor_0_p)
                        begin
                            pressed<=0;
                            
							PathwayAnalyzed<=0;
                        end
                    else if(floor_1_p)
                        begin
                            pressed<=1;
                            
							PathwayAnalyzed<=direction_1;
                        end                
                    else if(floor_2_p)
                        begin
                            pressed<=2;
                            
							PathwayAnalyzed<=direction_2;
                        end
                    else if(floor_3_p)
                        begin
                            pressed<=3;
                            
							PathwayAnalyzed<=direction_3;
                        end 
                    else if(floor_4_p)
                        begin
                            pressed<=4;
                            
							PathwayAnalyzed<=1;
                        end    
                    
                                       
                    if(floor_0_d==1 && kat0==0 ) 
                        begin
                            sevenD<=0;
                            
							ConcurrentP<=1;
                        end 
                    else if(floor_1_d==1 && kat1==0 ) 
                        begin
                            sevenD<=1;
                            
							ConcurrentP<=1;
                        end
                    else if(floor_2_d==1 && kat2==0 ) 
                        begin
                            sevenD<=2;
                            
							ConcurrentP<=1;
                        end
                    else if(floor_3_d==1 && kat3==0 ) 
                        begin
                            sevenD<=3;
                            
							ConcurrentP<=1;
                        end
                    else if(floor_4_d==1 && kat4==0 ) 
                        begin
                            sevenD<=4;
                            
							ConcurrentP<=1;
                        end                                                                        
                                                    
                    case(kat)
                        3'd0:
                            begin                  
                                if(decelerate<250)
                                    begin
                                        decelerate<=decelerate+1;
                                        
                                    end
                                else
                                    begin
                                        pressed<=7;
                                        
										decelerate<=1;
                                        
										ConcurrentP<=0;
										
										somewhere_in_M<=7;
                                        
										if(pressed!=7 && pressed!=0)
                                            begin
                                                oreg[pressed]<=1;
												
												Cleared<=0;
                                                
												Last_Point<=pressed;   
                                                
												kat<=kat+1;
                                                
												Pathway<=0;
                                            end     
                                        else if(ConcurrentP && sevenD!=0)
                                            begin
                                                inreg[sevenD]<=1;
												
												Cleared<=0;
                                                
												Last_Point<=sevenD;  
                                                
												kat<=kat+1;
                                                
												Pathway<=0;
                                            end
										else
										  begin
										      inreg[0]<=0;
											
											Cleared<=1;
											
											oreg[0]<=0;
                                          end
                                    end
                            end
                        3'd1:
                            begin
                                if(decelerate<250)
                                    begin
                                        decelerate<=decelerate+1;
                                        
                                    end
                                else
                                    begin       
                                        ConcurrentP<=0;
                                        
										pressed<=7;
										
										decelerate<=1;
                                        if(Last_Point==1 && Cleared==0)    
                                            begin
												Cleared<=1;
												
												inreg[1]<=0;
												
												oreg[1]<=0;
												
												Last_Point<=7;
                                            end

                                        else if(somewhere_in_M==1 && Cleared==0)    
                                            begin
                                                somewhere_in_M<=7;
                                                
												inreg[1]<=0;
                                                
												oreg[1]<=0;
                                            end											
                                        else 
											begin
												if(Cleared==0)
													begin
														if(Pathway==0)
															kat<=kat+1;
														else
															kat<=kat-1;
													end
													
												if(pressed!=7 &&  pressed!=1)
													begin
														if(Cleared==1)
															begin
															    oreg[pressed]<=1;
																
																somewhere_in_M<=7;
																
																Last_Point<=pressed;
																
																Cleared<=0;
																
																if(pressed>1)
																	Pathway<=0;
																else
																	Pathway<=1;
																
															end
															
														else if(Pathway==0)
															begin
																if(pressed<2)
																    begin
																    
																    end
																else if(pressed<Last_Point && PathwayAnalyzed ==Pathway)
																	begin
																	   oreg[pressed]<=1;
																		
																		somewhere_in_M<=pressed;
																		
																	end
																	
															end
														else
															begin
																
																	
															end                                                    
															
													end
												else if(ConcurrentP && sevenD!=1)
													begin
														if(Cleared==1)
															begin
															    inreg[sevenD]<=1;
																
																somewhere_in_M<=7;
																
																Last_Point<=sevenD;
																
																Cleared<=0;
																if(sevenD>1)
																	Pathway<=0;
																else
																	Pathway<=1;
																
															end													
														else if(Pathway==0)
															begin
																if(sevenD<2)
																    begin
																    
																    end
																else if(sevenD<Last_Point)
																    begin
																	   inreg[sevenD]<=1;
																	   
																	   somewhere_in_M<=sevenD;
																	end
															
															
															end
														else
															begin
															
															
															end
													
													end
											end
											
                                    
                                    
                                    end
                            
                            
                            end

                        3'd2:
                            begin
                                if(decelerate<250)
                                    begin
                                        decelerate<=decelerate+1;
                                        
                                    end
                                else
                                    begin   
                                        ConcurrentP<=0;
                                        
										pressed<=7;    
										
										decelerate<=1;
                                        if(Last_Point==2 && Cleared==0)    
                                            begin
                                                inreg[2]<=0;
												
												Cleared<=1;
												
												oreg[2]<=0;
												
												Last_Point<=7;
                                            end

                                        else if(somewhere_in_M==2 && Cleared==0)    
                                            begin
                                                inreg[2]<=0;
                                                
												oreg[2]<=0;
                                                
												somewhere_in_M<=7;
                                            end											
                                        else 
											begin
												if(Cleared==0)
													begin
														if(Pathway==0)
															kat<=kat+1;
														else
															kat<=kat-1;
													end
													
												if(pressed!=7 &&  pressed!=2)
													begin
														if(Cleared==1)
															begin
															    oreg[pressed]<=1;
																
																
																somewhere_in_M<=7;
																
																Last_Point<=pressed;
																
																Cleared<=0;
																if(pressed>2)
																	Pathway<=0;
																else
																	Pathway<=1;
																
															end
															
														else if(Pathway==0)
															begin
																if(pressed<3)
																    begin
																    
																    end
																else if(pressed<Last_Point && PathwayAnalyzed ==Pathway)// go there
																	begin
																	    oreg[pressed]<=1;
																		
																		somewhere_in_M<=pressed;
																		
																	end
																	
															end
														else
															begin

																if(pressed>=2) 
																    begin
																    
																    end
																else if(pressed>Last_Point && PathwayAnalyzed ==Pathway)
																	begin
																	   
																	   oreg[pressed]<=1;
																		
																		somewhere_in_M<=pressed;
																		
																	end
																																	
																	
															end                                                    
															
													end
												else if(ConcurrentP && sevenD!=2)
													begin
														if(Cleared==1)
															begin
															 
															    inreg[sevenD]<=1;
																
																somewhere_in_M<=7;
																
																Last_Point<=sevenD;
																
																Cleared<=0;
																if(sevenD>2)
																	Pathway<=0;
																else
																	Pathway<=1;
																
															end													
														else if(Pathway==0) 
															begin
																if(sevenD<3)
																    begin
																    
																    end
																else if(sevenD<Last_Point)
																    begin
																	   inreg[sevenD]<=1;
																	   
																	   somewhere_in_M<=sevenD;
															         end		
															
															
															end
														else
															begin
																if(sevenD>=2) 
																    begin
																    end
																else if(sevenD>Last_Point)
																	begin
																		somewhere_in_M<=sevenD;
																		
																		inreg[sevenD]<=1;
																	end
															
															end
													
													end
											end
											
                                    
                                    
                                    end
                            
                            
                            end				



                        3'd3:
                            begin
                                if(decelerate<250)
                                    begin
                                        decelerate<=decelerate+1;
                                        
                                    end
                                else
                                    begin  
                                        ConcurrentP<=0; 
										
                                        pressed<=7;   
										
										decelerate<=1;
										
                                        if(Last_Point==3 && Cleared==0)    
                                            begin
												Cleared<=1;
												
												inreg[3]<=0;
												
												oreg[3]<=0;
												
												Last_Point<=7;
                                            end

                                        else if(somewhere_in_M==3 && Cleared==0)    
                                            begin
                                                inreg[3]<=0;
												
                                                oreg[3]<=0;
												
                                                somewhere_in_M<=7;
                                            end											
                                        else 
											begin
												if(Cleared==0)
													begin
														if(Pathway==0)
															kat<=kat+1;
														else
															kat<=kat-1;
													end
													
												if(pressed!=7 &&  pressed!=3)
													begin
														if(Cleared==1)
															begin
															    oreg[pressed]<=1;
																
																somewhere_in_M<=7;
																
																Last_Point<=pressed;
																
																Cleared<=0;
																
																if(pressed>3)
																	Pathway<=0;
																else
																	Pathway<=1;
																
															end
															
														else if(Pathway==0)
															begin
												
																	
															end
														else
															begin

																if(pressed>=3)
																    begin
																    end
																    
																else if(pressed>Last_Point && PathwayAnalyzed ==Pathway)
																	begin
																	    oreg[pressed]<=1;
																		
																		somewhere_in_M<=pressed;
																		
																	end
																																	
																	
															end                                                    
															
													end
												else if(ConcurrentP && sevenD!=3)
													begin
														if(Cleared==1)
															begin
															    inreg[sevenD]<=1;
																
																somewhere_in_M<=7;
																
																Last_Point<=sevenD;
																
																Cleared<=0;
																
																if(sevenD>3)
																	Pathway<=0;
																else
																	Pathway<=1;
																
															end													
														else if(Pathway==0)
															begin

															
															end
														else
															begin
																if(sevenD>=3)
																    begin
																    
																    end
																else if(sevenD>Last_Point)
																	begin
																	   inreg[sevenD]<=1;
																	   
																		somewhere_in_M<=sevenD;
																		
																	end
															
															end
													
													end
											end
											
                                    
                                    
                                    end
                            
                            
                            end				
              
                
                

                        3'd4:
                            begin
                                if(decelerate<250)
                                    begin
                                        decelerate<=decelerate+1;
                                        
                                    end
                                else
                                    begin   
                                        ConcurrentP<=0; 
										
                                        pressed<=7;   
										
										decelerate<=1;
										
                                        if(Last_Point==4 && Cleared==0)    
                                            begin
                                                Last_Point<=7;
												
												Cleared<=1;
												
												inreg[4]<=0;
												
												oreg[4]<=0;
                                            end

                                        else if(somewhere_in_M==3 && Cleared==0)    
                                            begin
                                                inreg[4]<=0;
												
                                                oreg[4]<=0;
												
                                                somewhere_in_M<=7;
                                            end											
                                        else 
											begin
												if(Cleared==0)
													begin
														kat<=kat-1;
													end
													
												if(pressed!=7 &&  pressed!=4)
													begin
														if(Cleared==1)
															begin
															    oreg[pressed]<=1;
																
																somewhere_in_M<=7;
																
																Last_Point<=pressed;
																
																Cleared<=0;

																Pathway<=1;
																
															end
															
														else if(Pathway==0)
															begin
												
																	
															end
														else
															begin

																if(pressed>Last_Point && PathwayAnalyzed ==Pathway)
																	begin
																	    oreg[pressed]<=1;
																		
																		somewhere_in_M<=pressed;
																		
																	end
																																	
																	
															end                                                    
															
													end
												else if(ConcurrentP && sevenD!=4)
													begin
														if(Cleared==1)
															begin
															   inreg[sevenD]<=1;
															   
																somewhere_in_M<=7;
																
																Last_Point<=sevenD;
																
																Cleared<=0;

																Pathway<=1;
																
															end													
														else if(Pathway==0)
															begin

															
															end
														else
															begin
																if(sevenD>Last_Point)
																	begin
																		somewhere_in_M<=sevenD;
																		
																		inreg[sevenD]<=1;
																	end
															
															end
													
													end
											end
											
                                    
                                    
                                    end
                            
                            
                            end				
            
                
                endcase
                                
                
                
                
                
                
                
                end

        
        
        end
    
    
    
    
    
    
    
    
    
    
    
endmodule
