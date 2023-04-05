
--SELECT * FROM 
--[Portfolio Projects].dbo.NashvilleHousing

--SELECT SaleDateConverted, CONVERT(DATE, Saledate) FROM
--[Portfolio Projects].dbo.NashvilleHousing

--ALTER TABLE NashvilleHousing
--ADD SaleDateConverted Date;

--UPDATE NashvilleHousing
--SET SaleDateConverted = CONVERT(DATE, Saledate)

--SELECT *  FROM
--[Portfolio Projects].dbo.NashvilleHousing
--WHERE PropertyAddress IS NULL
--ORDER BY ParcelID

--SELECT a.ParcelID, a.PropertyAddress, b.ParcelID , b.PropertyAddress, 
--ISNULL (a.PropertyAddress, b.PropertyAddress )
--FROM [Portfolio Projects].dbo.NashvilleHousing a
--JOIN [Portfolio Projects].dbo.NashvilleHousing b
--ON a.ParcelID = b.ParcelID 
--AND a.UniqueID <> b.UniqueID
--WHERE a.PropertyAddress IS NULL

--UPDATE a
--SET PropertyAddress = ISNULL (a.PropertyAddress, b.PropertyAddress )
--FROM [Portfolio Projects].dbo.NashvilleHousing a
--JOIN [Portfolio Projects].dbo.NashvilleHousing b
--ON a.ParcelID = b.ParcelID 
--AND a.UniqueID <> b.UniqueID
--WHERE a.PropertyAddress IS NULL

--SELECT *  FROM
--[Portfolio Projects].dbo.NashvilleHousing
----WHERE PropertyAddress IS NULL
----ORDER BY ParcelID

--SELECT   
--SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) as Address
--, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress)) as Address

--FROM
--[Portfolio Projects].dbo.NashvilleHousing

--ALTER TABLE NashvilleHousing
--ADD PropertySplitAddress nvarchar(255);

--UPDATE NashvilleHousing
--SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1)

--ALTER TABLE NashvilleHousing
--ADD PropertySplitCity nvarchar(255);

--UPDATE NashvilleHousing
--SET PropertySplitCity =  SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress))

--SELECT 
--PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3),
--PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2),
--PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
--FROM [Portfolio Projects].dbo.NashVilleHousing

--ALTER TABLE NashvilleHousing
--ADD OwnerSplitAddress nvarchar(255)

--UPDATE NashvilleHousing
--SET OwnerSplitAddress =  PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)

--ALTER TABLE NashvilleHousing
--ADD OwnerSplitCity nvarchar(255)

--UPDATE NashvilleHousing
--SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)

--ALTER TABLE NashvilleHousing
--ADD OwnerSplitState nvarchar(255)

--UPDATE NashvilleHousing
--SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)

--SELECT DISTINCT SoldAsVacant, COUNT(SoldAsVacant)
--FROM
--[Portfolio Projects].dbo.NashvilleHousing
--GROUP BY SoldAsVacant
--ORDER BY 2

--SELECT SoldAsVacant,
--	CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
--		WHEN SoldAsVacant = 'N' THEN 'No'
--		ELSE SoldAsVacant
--		END
--FROM [Portfolio Projects].dbo.NashvilleHousing

--UPDATE NashVilleHousing 
--SET SoldAsVacant = 
--CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
--		WHEN SoldAsVacant = 'N' THEN 'No'
--		ELSE SoldAsVacant
--		END
--FROM  [Portfolio Projects].dbo.NashvilleHousing

--WITH RowNumCTE as (
--SELECT *,
--ROW_NUMBER() OVER(
--PARTITION BY ParcelID,
--			PropertyAddress,
--			SaleDate, 
--			SalePrice,
--			LegalReference
--			ORDER BY 
--			UniqueID
--				) row_num
--FROM  [Portfolio Projects].dbo.NashvilleHousing
----ORDER BY [ParcelID]
--)
--SELECT *
--FROM RowNumCTE
--WHERE row_num >1 
----ORDER BY PropertyAddress

--SELECT * 
--FROM [Portfolio Projects].dbo.NashVilleHousing

--ALTER TABLE [Portfolio Projects].dbo.NashVilleHousing
--DROP COLUMN PropertyAddress, SaleDate, OwnerAddress, TaxDistrict 
