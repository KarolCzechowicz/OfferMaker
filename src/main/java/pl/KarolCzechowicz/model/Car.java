package pl.KarolCzechowicz.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "cars")
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Manufacturer manufacturer;

    @ManyToOne
    private CarModel carModel;

    @ManyToOne
    private Transmission transmission;

    @ManyToOne
    private Fuel fuel;
    private String fuelCity;
    private String fuelHighway;
    private String engine;
    private String horsePower;

    @ManyToOne
    private DriveType driveType;

    @ManyToOne
    private Seat seat;

    private String description;
    private boolean airCondition;
    private boolean parkAssist;
    private boolean reverseCamera;
    private boolean isofix;
    private boolean airBags;
    private boolean navigation;
    private boolean electricWindows;

    private String imageLink;

    private Date created;

    private Date updated;

    private String userLogin;

    private String userEmail;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Manufacturer getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(Manufacturer manufacturer) {
        this.manufacturer = manufacturer;
    }

    public CarModel getCarModel() {
        return carModel;
    }

    public void setCarModel(CarModel carModel) {
        this.carModel = carModel;
    }

    public Transmission getTransmission() {
        return transmission;
    }

    public void setTransmission(Transmission transmission) {
        this.transmission = transmission;
    }

    public Fuel getFuel() {
        return fuel;
    }

    public void setFuel(Fuel fuel) {
        this.fuel = fuel;
    }

    public String getFuelCity() {
        return fuelCity;
    }

    public void setFuelCity(String fuelCity) {
        this.fuelCity = fuelCity;
    }

    public String getFuelHighway() {
        return fuelHighway;
    }

    public void setFuelHighway(String fuelHighway) {
        this.fuelHighway = fuelHighway;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public String getHorsePower() {
        return horsePower;
    }

    public void setHorsePower(String horsePower) {
        this.horsePower = horsePower;
    }

    public DriveType getDriveType() {
        return driveType;
    }

    public void setDriveType(DriveType driveType) {
        this.driveType = driveType;
    }

    public Seat getSeat() {
        return seat;
    }

    public void setSeat(Seat seat) {
        this.seat = seat;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isAirCondition() {
        return airCondition;
    }

    public void setAirCondition(boolean airCondition) {
        this.airCondition = airCondition;
    }

    public boolean isParkAssist() {
        return parkAssist;
    }

    public void setParkAssist(boolean parkAssist) {
        this.parkAssist = parkAssist;
    }

    public boolean isReverseCamera() {
        return reverseCamera;
    }

    public void setReverseCamera(boolean reverseCamera) {
        this.reverseCamera = reverseCamera;
    }

    public boolean isIsofix() {
        return isofix;
    }

    public void setIsofix(boolean isofix) {
        this.isofix = isofix;
    }

    public boolean isAirBags() {
        return airBags;
    }

    public void setAirBags(boolean airBags) {
        this.airBags = airBags;
    }

    public boolean isNavigation() {
        return navigation;
    }

    public void setNavigation(boolean navigation) {
        this.navigation = navigation;
    }

    public boolean isElectricWindows() {
        return electricWindows;
    }

    public void setElectricWindows(boolean electricWindows) {
        this.electricWindows = electricWindows;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public String getUserLogin() {
        return userLogin;
    }

    public void setUserLogin(String userLogin) {
        this.userLogin = userLogin;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
}
